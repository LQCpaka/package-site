const formidable = require('formidable');
const fs = require('fs');
const path = require('path');
const sachModel = require('../models/sachModel');

const sachList = async (req, res) => {
    let sachs = await sachModel.listSach();
    res.render("sachlist",{sachs});
}

const sachThemGet = (req, res) => {
    res.render("themsach");
}

const sachThemPost = (req, res) => {
    let form = new formidable.IncomingForm();
    form.parse(req, async (err, fields, files) => {
        if (err) {
            console.log('Lỗi khi upload dữ liệu');
        } else {
            let{tenSach, donGia, xuatXu, moTa, nhaXB} = fields;
            let urlHinh = files.urlHinh.originalFilename;
            let sach = { tenSach, donGia, xuatXu, nhaXB,moTa,urlHinh };
            await sachModel.sachADD(sach);

            let oldPath = files.urlHinh.filepath;
            let desPath = path.join(__dirname, "..\\public\\images\\") + urlHinh;
            
            fs.copyFile(oldPath, desPath, (err) => {
                if (err) {
                    throw err;
                }
                fs.unlink(oldPath, () => console.log("Đã xoá file tạm"));
                console.log("uploaded success file " + urlHinh);
                res.redirect('/sach/list');
            })
        }
    });
}

const sachSuaGet = async (req, res) => {
    let id = parseInt(req.params.id);
    let sach = await sachModel.getSachById(id);
    res.render("suasach",{sach});
}

const sachSuaPost = (req,res) => {
    const form = new formidable.IncomingForm();
    form.parse(req, async (err, fields, files) => {
        let { id, tenSach, donGia, xuatXu, nhaXB, moTa, urlHinh } = fields;
        let { originalFilename, filepath } = files.urlHinh;
        
        let oldPath = path.join(__dirname, "..\\public\\images") + "\\" + urlHinh;
        
        urlHinh = originalFilename ? originalFilename : urlHinh;
        
        let newSach = { id:parseInt(id), tenSach, donGia, xuatXu, nhaXB, moTa, urlHinh };
        
        await sachModel.sachUpdate(newSach);

        res.redirect('/sach/list');
        if (originalFilename) {
            let newPath = path.join(__dirname, "..\\public\\images") + "\\" + originalFilename;
            fs.copyFile(filepath, newPath, (err) => {
                if (err) {
                    throw err;
                }
                fs.unlink(filepath, () => console.log("Đã xoá file tạm"));
                fs.unlink(oldPath, () => console.log("Đã xoá file cũ"))
                console.log("uploaded success file " + originalFilename);
            })
        }
    })
}

const sachXoa = async (req, res) => {
    let id =parseInt(req.params.id);
    let sach = await sachModel.getSachById(id);
    let deletePath = path.join(__dirname,"..\\public\\images\\") + sach.urlHinh;
    await sachModel.sachDelete(id);
    // Xoá hình tương ứng trong images
    fs.unlink(deletePath, () => console.log("Đã xoá file "));
    res.redirect('/sach/list');    
}
module.exports = {
    sachList, sachThemGet, sachThemPost, sachSuaGet, sachSuaPost, sachXoa
}
const db = require('./database');

// Tạo schema cho collection nhaXBs
const nhaXBSchema = new db.Schema({
    id: Number,
    tenNXB: String   
}, { versionKey: false });

// Đăng ký schema cho model nhaXBs
const nhaxbs = db.model('nhaxbs', nhaXBSchema);

// Tạo schema cho collection sachs
const sachSchema = new db.Schema({
    id: Number,
    tenSach: String,
    donGia: Number,
    xuatXu: Boolean,
    nhaXB:Number,
    moTa: String,
    urlHinh: String
}, { versionKey: false });

// Đăng ký schema cho model sachs
const sachs = db.model('sachs', sachSchema);

//4. thực hiện các thao tác
//4.1 đọc danh sách document
const listSach=async()=>{
    try{
        
        const list = await sachs.find({});
        return list;
        
    }catch(error){
        throw error;
        
    }
}
 //4.2 thêm 1 document vào collection
 const sachADD=async(sach)=>{
    sach.id=await sachs.find({}).count()+1;
    await sachs.create(sach);
 }

//  4.3 đọc một document theo id truyền vào trong collection
const getSachById=async(id)=>{
    try{
        const sach =await sachs.findOne({id});
        return sach;
    }catch(error){
        throw error;
    }
}
//4.4 cập nhật  một document trong collection   
const sachUpdate = async(sach)=>{
    await sachs.updateOne({id:sach.id},sach);
}
// 4.5 xóa một document trong collection
const sachDelete = async(id)=>{
    await sachs.deleteOne({id});
}
module.exports = { listSach , sachADD,getSachById,sachUpdate,sachDelete }

const db=require('mongoose');
const connect = async () => {
    try{
        await db.connect('mongodb://localhost/sachmongoose');
        console.log('connected success');
    }catch(err){
        throw err;
    }
}
connect();
console.log('connected success sever MongoDB with Mongoose');
module.exports=db; 
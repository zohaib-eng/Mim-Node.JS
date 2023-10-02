const multer=require('multer');
const path=require('path');
const {createServer}=require('http')
const port =process.env.PORT|| 3000;

const storage=(destinition)=>multer.diskStorage({
    destination:destinition,
    filename:(req,file,cb)=>{
        return cb(null,`${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
    }
})

const fileupload=(destination)=>multer({
    storage:storage(destination),
    limits:{
        fileSize:10*1024*1024,
    },
    fileFilter:(req,file,cb)=>{
        if(file.mimetype=="image/png" || file.mimetype=="image/jpg" || file.mimetype=="image/jpeg"){
            cb(null,true);
        }else{
            cb(null,false);
            return cb(new Error('only .png, .jpg, .jpeg formate allowed!'));
        }
    },
    onError:function(err,next){
        return console.log('error',err)
        next(err);
    }
}).single('image')


// createServer((req, res) => {

//     // create a dynamic file path
//     let filePath = path.join(__dirname, 'public', req.url === '/' ? '/photo/images' : req.url)
//     console.log(filePath)
//     // default content type
//     let contentType = '/photo/images'

//     // extract the extension from the filepath
//     let mimeType = path.extname(filePath)

//     // load various image types
//     switch (mimeType) {
//         case '.png': contentType = 'image/png'; break;
//         case '.jpg': contentType = 'image/jpg'; break;
//         case '.jpeg': contentType = 'image/jpeg'; break;
//     }

//     // read the target file and send to the client.
//     fs.readFile(filePath, (error, data) => {
//         // stop the execution and send nothing if the requested file path does not exist.
//         if (error) return
        
//         // otherwise, fetch and show the target image
//         res.writeHead(200, { 'Content-Type': contentType })
//         res.end(data, 'utf8')
    
//     })
    
// })
// // .listen(port, () => {
// //     console.log(`app listening at http://0.0.0.0:${port}`)
// //   });



module.exports=fileupload;
// module.exports=createServer;
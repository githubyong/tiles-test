/*
	�Ƿ�ָ�����ļ��Ĵ�С���ڲ���filesize��ֵ��filesize�ĵ�λ���ֽڡ�
*/
	function compareFileSize(fileName,filesize){
		if(getFileSize(fileName) > filesize){
			return true;
		}
		return false;
	}

/*
	ȡ���ļ��ĳߴ�
*/
	function getFileSize(filespec){
		var fileObject = new ActiveXObject("Scripting.FileSystemObject");
		var file = fileObject.getFile(filespec);
		return file.size;
	}

	/*
    ȡ���ļ���չ��
*/
    function getFileExtName(fileName){
        var name = "";
		fileName = getFileName(fileName);
		if(fileName.length > 0){
			if(fileName.indexOf(".")<0){
				fileName = "."+fileName;
			}
			name = fileName.substr(fileName.lastIndexOf(".")).toLowerCase();
		}
		return name;
    }
	
/*
    ȡ�ò�����չ�����ļ���
*/
    function getFileNameWithoutExt(fileName){
        var name = "";
		fileName = getFileName(fileName);
		if(fileName.length > 0 && fileName.indexOf(".")>0){
			name = fileName.substring(0,fileName.indexOf("."));
		}else{
			name = fileName;
		}

        return name;
    }
	
	/*
	ȡ���ļ������ƣ�ȥ�����ļ�������·��
	*/
	function getFileName(fileName){
		var name = "";
		if(fileName.lastIndexOf("\\")>0){
			name = fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		}else{
			name = fileName;
		}

		return name;
	}

/*
	ȡ���ļ���·��
*/
    function getFilePath(fileName){
        var name = "";
        if(fileName.lastIndexOf("\\")>0){
            name = fileName.substring(0,fileName.lastIndexOf("\\"));
        }else{
            name = "";
        }
        return name;
    }

/**
*	ȥ���ļ����в��ܰ����������ַ����磺\/:*?"<>|
**/		
	function escapeSpecCharInFileName(fileName){
		var rtnVal = fileName.replace("\\","");
		rtnVal = fileName.replace("/","");
		rtnVal = fileName.replace(":","��");
		rtnVal = fileName.replace("*","��");
		rtnVal = fileName.replace("?","��");
		rtnVal = fileName.replace("<","��");
		rtnVal = fileName.replace(">","��");
		rtnVal = fileName.replace("|","��");
		rtnVal = fileName.replace("\"","��");
		
		return rtnVal;
	}
	
	/**
		�����ļ�
	**/
	function copyFile(srcFile,destFile){
	  var fso = new ActiveXObject("Scripting.FileSystemObject");
	  fso.CopyFile(srcFile,destFile);
	}
	
	/**
	*	ɾ���ļ�
	**/
	function delFile(file){
	  var fso = new ActiveXObject("Scripting.FileSystemObject");
	  fso.DeleteFile(file);	
	}
	
	/**
	*	�ƶ��ļ���λ��
	*/	
	function moveFile(srcFile,destFile){
	  var fso = new ActiveXObject("Scripting.FileSystemObject");
	  fso.MoveFile(srcFile,destFile);	
	}
	
	/**�����ļ�*/
	function saveFile(sContent,sFileName){
        try{
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            var textStream = fso.CreateTextFile(sFileName,true);
            textStream.Write(sContent);
            textStream.close();
        }catch(e){
            throw e.message;
        }
    }
	
	function showFileAccessInfo(filespec) {
	   var fso, f, s;
	   fso = new ActiveXObject("Scripting.FileSystemObject");
	   f = fso.GetFile(filespec); // filespec ��ָ���ļ���·�������Ժͻ���Եģ�����ѡ�
	   return f.DateLastModified;
	}

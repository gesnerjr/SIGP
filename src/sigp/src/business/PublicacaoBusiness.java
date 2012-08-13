package sigp.src.business;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PublicacaoBusiness {
	
	/*
	 * PATH/id/
	 * PATH/id/presentation/
	 * PATH/id/paper/
	 */

	private static final String PATH = "/sigpfiles/public/publications/";

	public PublicacaoBusiness(){
	}
	
	private String getPath(Long id, String file){
		return PATH + id + "/" + file;
	}
	
	public void salvarPdf(Long id, UploadedFile pdf) throws IOException {
		if (pdf != null) {
			try {
				File dir = new File(getPath(id,"/paper/"));
				if (dir.exists()){
					for (File f: dir.listFiles()) f.delete();
				} else {
					dir.mkdir();
				}
				IOUtils.copy(pdf.getFile(), new FileOutputStream(new File(getPath(id,"/paper/"+pdf.getFileName()))));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new FileNotFoundException("Arquivo não encontrado!");
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("Não foi possível enviar o arquivo!");
			}
		}
	}

	public File downloadPdf(Long id) {
		File dir = new File(getPath(id,"/paper/"));
		if (dir.exists()){
			File[] f = dir.listFiles();
			if (f.length != 0) return f[0];
		}
		return null;
	}

	public void removerPdf(Long id) {
		File dir = new File(getPath(id,"/paper/"));
		if (dir.exists()){
			for (File f: dir.listFiles()) f.delete();
		}
	}
	
	List<String> getFiles(Long id){
		List<String> fileList = new ArrayList<String>();
		File dir = new File(getPath(id,""));
		for (File f: dir.listFiles()){
			if (f.isFile()) fileList.add(f.getName());
		}
		return fileList;
	}

}
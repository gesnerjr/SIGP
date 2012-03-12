package sigp.src.business;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MembroBusiness {

	private static final String PATH_IMG = "/home/petals/sigpfiles/member";

	public MembroBusiness(){
	}

	public void salvarImagem(Long id, UploadedFile image) throws IOException {
		if (image != null) {
			try {
				IOUtils.copy(image.getFile(), new FileOutputStream(new File(PATH_IMG + "/" + id + ".jpg")));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new FileNotFoundException("Arquivo não encontrado!");
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("Não foi possível enviar o arquivo!");
			}
		}
	}

	public File downloadImagem(Long id) {
		File file = new File(PATH_IMG + "/" + id + ".jpg");
		return (file.exists()) ? file : null;
	}

	public void removerImagem(Long id) {
		File file = new File(PATH_IMG + "/" + id + ".jpg");
		if (file.exists()) {
			file.delete();
		}
	}

}
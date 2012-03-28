package sigp.src.business;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.im4java.core.ConvertCmd;
import org.im4java.core.IM4JavaException;
import org.im4java.core.IMOperation;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MembroBusiness {

	private static final String PATH_IMG = "/home/petals/sigpfiles/member";

	public MembroBusiness(){
	}

	public String salvarImagem(Long id, UploadedFile image) throws IOException {
		String result = null;
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
			result = id + ".jpg";
		} else {
			System.out.println("NULL IMAGE FILE!!!!!");
		}
		return result;
	}

	public File downloadImagem(Long id) {
		File file = new File(PATH_IMG + "/" + id + ".jpg");
		File fallback = new File(PATH_IMG + "/member.jpg");
		return (file.exists()) ? file : fallback;
	}

	public void removerImagem(Long id) {
		File file = new File(PATH_IMG + "/" + id + ".jpg");
		if (file.exists()) {
			file.delete();
		}
	}

	public void resizeImage(Long id, Integer x, Integer y, Integer w, Integer h) {
		String filename = PATH_IMG + "/" + id + ".jpg";
		
		// create command
		ConvertCmd cmd = new ConvertCmd();

		// create the operation, add images and operators/options
		IMOperation op = new IMOperation();
		op.addImage(filename);
		op.crop(w, h, x, y);
		op.resize(125,125);
		op.addImage(filename);

		// execute the operation
		try {
			cmd.run(op);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IM4JavaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
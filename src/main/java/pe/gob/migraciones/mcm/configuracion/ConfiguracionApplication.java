package pe.gob.migraciones.mcm.configuracion;

import java.io.IOException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ConfiguracionApplication {

    public static void main(String[] args) throws IOException {
        SpringApplication.run(ConfiguracionApplication.class, args);
    }
}

package pe.gob.migraciones.mcm.configuracion.controller;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author epalacios
 */
@RestController
public class DevolucionController {

    @GetMapping("/")
    public String home() {
        return "<h2>Hello World!</h2>";
    }
}

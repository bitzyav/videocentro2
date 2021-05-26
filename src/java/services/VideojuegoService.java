/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

/**
 *
 * @author Bitzy
 */
public class VideojuegoService {

    public VideojuegoService() {
    }

    public static java.util.List<services.Videojuego> obtenerVideojuegos() {
        services.Services_Service service = new services.Services_Service();
        services.Services port = service.getServicesPort();
        return port.obtenerVideojuegos();
    }
    
    
}

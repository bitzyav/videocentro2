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
public class ClienteService {
    
    public ClienteService(){
        
    }
    
    public static java.util.List<services.Cliente> obtenerClientes() {
        services.Services_Service service = new services.Services_Service();
        services.Services port = service.getServicesPort();
        return port.obtenerClientes();
    }
}

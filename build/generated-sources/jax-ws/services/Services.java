
package services;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "Services", targetNamespace = "http://services/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface Services {


    /**
     * 
     * @return
     *     returns java.util.List<services.Cliente>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "obtenerClientes", targetNamespace = "http://services/", className = "services.ObtenerClientes")
    @ResponseWrapper(localName = "obtenerClientesResponse", targetNamespace = "http://services/", className = "services.ObtenerClientesResponse")
    @Action(input = "http://services/Services/obtenerClientesRequest", output = "http://services/Services/obtenerClientesResponse")
    public List<Cliente> obtenerClientes();

    /**
     * 
     * @return
     *     returns java.util.List<services.Videojuego>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "obtenerVideojuegos", targetNamespace = "http://services/", className = "services.ObtenerVideojuegos")
    @ResponseWrapper(localName = "obtenerVideojuegosResponse", targetNamespace = "http://services/", className = "services.ObtenerVideojuegosResponse")
    @Action(input = "http://services/Services/obtenerVideojuegosRequest", output = "http://services/Services/obtenerVideojuegosResponse")
    public List<Videojuego> obtenerVideojuegos();

}


package services;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the services package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ObtenerClientesResponse_QNAME = new QName("http://services/", "obtenerClientesResponse");
    private final static QName _ObtenerVideojuegos_QNAME = new QName("http://services/", "obtenerVideojuegos");
    private final static QName _ObtenerVideojuegosResponse_QNAME = new QName("http://services/", "obtenerVideojuegosResponse");
    private final static QName _ObtenerClientes_QNAME = new QName("http://services/", "obtenerClientes");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: services
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ObtenerVideojuegos }
     * 
     */
    public ObtenerVideojuegos createObtenerVideojuegos() {
        return new ObtenerVideojuegos();
    }

    /**
     * Create an instance of {@link ObtenerVideojuegosResponse }
     * 
     */
    public ObtenerVideojuegosResponse createObtenerVideojuegosResponse() {
        return new ObtenerVideojuegosResponse();
    }

    /**
     * Create an instance of {@link ObtenerClientes }
     * 
     */
    public ObtenerClientes createObtenerClientes() {
        return new ObtenerClientes();
    }

    /**
     * Create an instance of {@link ObtenerClientesResponse }
     * 
     */
    public ObtenerClientesResponse createObtenerClientesResponse() {
        return new ObtenerClientesResponse();
    }

    /**
     * Create an instance of {@link Cliente }
     * 
     */
    public Cliente createCliente() {
        return new Cliente();
    }

    /**
     * Create an instance of {@link Videojuego }
     * 
     */
    public Videojuego createVideojuego() {
        return new Videojuego();
    }

    /**
     * Create an instance of {@link Articulo }
     * 
     */
    public Articulo createArticulo() {
        return new Articulo();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerClientesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://services/", name = "obtenerClientesResponse")
    public JAXBElement<ObtenerClientesResponse> createObtenerClientesResponse(ObtenerClientesResponse value) {
        return new JAXBElement<ObtenerClientesResponse>(_ObtenerClientesResponse_QNAME, ObtenerClientesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerVideojuegos }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://services/", name = "obtenerVideojuegos")
    public JAXBElement<ObtenerVideojuegos> createObtenerVideojuegos(ObtenerVideojuegos value) {
        return new JAXBElement<ObtenerVideojuegos>(_ObtenerVideojuegos_QNAME, ObtenerVideojuegos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerVideojuegosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://services/", name = "obtenerVideojuegosResponse")
    public JAXBElement<ObtenerVideojuegosResponse> createObtenerVideojuegosResponse(ObtenerVideojuegosResponse value) {
        return new JAXBElement<ObtenerVideojuegosResponse>(_ObtenerVideojuegosResponse_QNAME, ObtenerVideojuegosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerClientes }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://services/", name = "obtenerClientes")
    public JAXBElement<ObtenerClientes> createObtenerClientes(ObtenerClientes value) {
        return new JAXBElement<ObtenerClientes>(_ObtenerClientes_QNAME, ObtenerClientes.class, null, value);
    }

}

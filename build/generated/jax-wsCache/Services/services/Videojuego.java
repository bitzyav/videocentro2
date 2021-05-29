
package services;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para videojuego complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="videojuego">
 *   &lt;complexContent>
 *     &lt;extension base="{http://services/}articulo">
 *       &lt;sequence>
 *         &lt;element name="consola" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="fabricante" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="version" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "videojuego", propOrder = {
    "consola",
    "fabricante",
    "version"
})
public class Videojuego
    extends Articulo
{

    protected String consola;
    protected String fabricante;
    protected int version;

    /**
     * Obtiene el valor de la propiedad consola.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConsola() {
        return consola;
    }

    /**
     * Define el valor de la propiedad consola.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConsola(String value) {
        this.consola = value;
    }

    /**
     * Obtiene el valor de la propiedad fabricante.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFabricante() {
        return fabricante;
    }

    /**
     * Define el valor de la propiedad fabricante.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFabricante(String value) {
        this.fabricante = value;
    }

    /**
     * Obtiene el valor de la propiedad version.
     * 
     */
    public int getVersion() {
        return version;
    }

    /**
     * Define el valor de la propiedad version.
     * 
     */
    public void setVersion(int value) {
        this.version = value;
    }

}

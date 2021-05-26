
package services;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for videojuego complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
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
     * Gets the value of the consola property.
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
     * Sets the value of the consola property.
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
     * Gets the value of the fabricante property.
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
     * Sets the value of the fabricante property.
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
     * Gets the value of the version property.
     * 
     */
    public int getVersion() {
        return version;
    }

    /**
     * Sets the value of the version property.
     * 
     */
    public void setVersion(int value) {
        this.version = value;
    }

}

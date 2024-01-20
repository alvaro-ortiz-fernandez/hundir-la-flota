/*
 * Clase base para representar cualquier elemento con interfaz visual
 * para mostrar en la interfaz de usuario del programa.
 */
public abstract class ElementoInterfaz {
  
    // Campos de la clase
    protected final Volumen volumen;
    protected final Coordenada posicion;
    protected final ArrayList<ElementoInterfaz> elementos;
    private HashMap<String, PGraphics> vistas;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public ElementoInterfaz(Volumen volumen, Coordenada posicion) {
        this.volumen = volumen;
        this.posicion = posicion;
        this.elementos = new ArrayList();
        this.vistas = new HashMap();
    }
    
    /*
     * Método que devuelve el volúmen de éste elemento.
     */
    public Volumen getVolumen() {
        return this.volumen;
    }
    
    /*
     * Método que devuelve el volúmen de éste elemento.
     */
    public Coordenada getPosicion() {
        return this.posicion;
    }
    
    /*
     * Método que añade a este elemento de interfaz un elemento hijo.
     */
    public void nuevoElemento(ElementoInterfaz elemento) {
        this.elementos.add(elemento);
    }
    
    /*
     * Método que informa a este elemento de interfaz que el puntero ha sido clickado.
     */
    public void mouseActivado() {
        // Por defecto no hacemos nada, sólo informamos a los elementos hijos
        for (ElementoInterfaz elemento : this.elementos)
            elemento.mouseActivado();
    }
    
    /*
     * Método que añade a este elemento de interfaz una vista a poder mostrar.
     */
    public void nuevaVista(String nombre, PImage img) {
        if (img != null)
            this.vistas.put(nombre, this.crearVista(img));
    }
    
    /*
     * Método que pinta el elemento de interfaz en el programa.
     */
    public void mostrarVista(String vista) {
        image(this.vistas.get(vista), this.posicion.getPosicionHorizontal(), this.posicion.getPosicionVertical());
    }
    
    /*
     * Método que indica si el puntero del ratón se encuentra dentro de los límites de este elemento.
     */
    public boolean mouseIn() {
        return mouseX > this.posicion.getPosicionHorizontal()
              && mouseX < (this.posicion.getPosicionHorizontal() + this.volumen.getAnchura())
              && mouseY > this.posicion.getPosicionVertical()
              && mouseY < (this.posicion.getPosicionVertical() + this.volumen.getAltura());
    }
    
    /*
     * Método que deben implementar las clases que hereden de ElementoInterfaz
     * para decidir cómo mostrar el elemento en pantalla.
     */
    abstract void mostrar();
    
    /*
     * Método que crea el elemento gráfico para poder ser mostrado posteriormente.
     */
    private PGraphics crearVista(PImage img) {
        // Creamos un objeto PGraphics para aplicar efectos gráficos
        PGraphics grafico = createGraphics(this.volumen.getAnchura(), this.volumen.getAltura());
        grafico.beginDraw();
        
        // Redimensionamos la imagen
        img.resize(this.volumen.getAnchura(), this.volumen.getAltura());
        
        grafico.image(img, 0, 0);
        
        // Y la pintamos
        grafico.endDraw();
        return grafico;
    }
}

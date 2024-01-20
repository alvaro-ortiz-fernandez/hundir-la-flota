/*
 * Clase base con la lógica compartida por las distintas pantallas del programa.
 */
public abstract class Pantalla extends ElementoInterfaz {
  
    // Campos de la clase
    protected final Reloj reloj;
    protected final Navegacion navegacion;
    protected final AlmacenRecursos almacen;
    protected final Configuracion configuracion;
    protected final PaletaColores paletaColores;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Pantalla(final Volumen volumen, final Reloj reloj, final Navegacion navegacion,
            final AlmacenRecursos almacen, final Configuracion configuracion, final PaletaColores paletaColores) {
              
        super(volumen, new Coordenada(0, 0));
        super.nuevaVista("background-green", almacen.getImagen("background-green"));
        super.nuevaVista("background-yellow", almacen.getImagen("background-yellow"));
        
        this.reloj = reloj;
        this.navegacion = navegacion;
        this.almacen = almacen;
        this.configuracion = configuracion;
        this.paletaColores = paletaColores;
    }
    
    /**
     * Método que indica si ésta pantalla se está mostrando en el programa actualmente.
     */
    public boolean activa() {
        return navegacion.getPantallaActual() == getIdPantalla();
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * el fondo de pantalla por defecto.
     */
    @Override
    public void mostrar() {
        // Establecemos el fondo de pantalla en base a la configuración
        if (this.configuracion.imagen1Seleccionada())
            super.mostrarVista("background-green");
        else if (this.configuracion.imagen2Seleccionada())
            super.mostrarVista("background-yellow");
        else
            background(paletaColores.grisClaro); // Color de fondo en código RGB (gris)
    }
    
    /*
     * Método que sobrescribe de ElementoInterfaz para controlar
     * que sólo se active si la pantalla está activa.
     */
    @Override
    public void mouseActivado() {
        if (activa())
            super.mouseActivado();
    }
    
    /**
     * Método que deben implementar las clases que hereden de Pantalla
     * para devolver su nombre identificador.
     */
    public abstract String getIdPantalla();
}

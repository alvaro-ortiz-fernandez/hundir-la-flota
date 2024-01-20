/*
 * Clase para mostrar los elementos que intervienen en el proceso de juego.
 */
public class PantallaJuego extends Pantalla {
  
    // Campos de la clase
    private final Juego juego;
    private final Boton botonMenu;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public PantallaJuego(final Volumen volumen, final Reloj reloj,
            final AlmacenRecursos almacen, final Configuracion configuracion,
            final Navegacion navegacion, final PaletaColores paletaColores) {
              
        // Invocamos al constructor padre
        super(volumen, reloj, navegacion, almacen, configuracion, paletaColores);
        
        // Inicializamos las variables de esta clase
        this.juego = new Juego(volumen, super.posicion, reloj, almacen, paletaColores);
        super.nuevoElemento(this.juego);
        
        this.botonMenu = new Boton(
            "btn-volver", super.almacen.getImagen("btn-volver"), // Color normal
            "btn-volver-hover", super.almacen.getImagen("btn-volver-hover"), // Color oscurecido
            new Volumen(210, 46), // Tamaño
            new Coordenada(495, 750), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    navegacion.establecerPantalla("Menu");
                    juego.reiniciar();
                }
            }, almacen
        );
        super.nuevoElemento(this.botonMenu);
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * los distintos elementos del proceso de Juego.
     */
    @Override
    public void mostrar() {
        // Cargamos la vista por defecto
        super.mostrar();
        
        // Mostramos el proceso de juego
        juego.mostrar();
        
        // Mostramos los botones
        botonMenu.mostrar();
        
        // Mostramos los textos de inicio
        textSize(18); // Tamaño del texto
        
        fill(paletaColores.negro); // Color del texto
        text(
            "TIEMPO", // Texto
            560, // Posición X
            40  // Posición Y
        );
        
        fill(paletaColores.azul); // Color del texto
        text(
            reloj.getTiempoRedondeado(1) + " s", // Texto
            (reloj.getTiempo() < 10) ? 574 : 570, // Posición X
            70  // Posición Y
        );
        
        // Mostramos el texto de resultado
        if (juego.finalizado()) {
            textSize(42);
            if (this.juego.getCampoContrincante().hundido()) {
                fill(this.paletaColores.azul); // Color de trazado
                text(
                    "¡Victoria!", // Texto
                    this.juego.getCampoContrincante().getPosicion().getPosicionHorizontal() + 105, // Posición X
                    this.juego.getCampoContrincante().getPosicion().getPosicionVertical()
                        + this.juego.getCampoContrincante().getVolumen().getAltura() + 90          // Posición Y
                );
            } else {
                fill(this.paletaColores.rojo); // Color de trazado
                text(
                    "Derrota", // Texto
                    this.juego.getCampoPropio().getPosicion().getPosicionHorizontal() + 110, // Posición X
                    this.juego.getCampoPropio().getPosicion().getPosicionVertical()
                        + this.juego.getCampoPropio().getVolumen().getAltura() + 90          // Posición Y
                );
            }
        }
    }
    
    /*
     * Método que implementa para Pantalla para devolver el nombre identificador de ésta Pantalla.
     */
    @Override
    public String getIdPantalla() {
        return "Juego";
    }
}

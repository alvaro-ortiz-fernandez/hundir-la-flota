/*
 * Clase para mostrar los elementos que permiten la configuración del programa.
 */
public class PantallaConfiguracion extends Pantalla {
  
    // Campos de la clase
    private final BotonSwitch botonMusica1;
    private final BotonSwitch botonMusica2;
    private final BotonSwitch botonImagen1;
    private final BotonSwitch botonImagen2;
    private final Boton botonMenu;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public PantallaConfiguracion(final Volumen volumen, final Reloj reloj,
            final AlmacenRecursos almacen, final Configuracion configuracion,
            final Navegacion navegacion, final PaletaColores paletaColores) {
              
        // Invocamos al constructor padre
        super(volumen, reloj, navegacion, almacen, configuracion, paletaColores);
        
        // Inicializamos las variables de esta clase
        this.botonMusica1 = new BotonSwitch(
            "radiobtn-musica-1-no", super.almacen.getImagen("radiobtn-musica-1-no"), // Botón sin seleccionar
            "radiobtn-musica-1-si", super.almacen.getImagen("radiobtn-musica-1-si"), // Botón seleccionado
            new Volumen(210, 37), // Tamaño
            new Coordenada(495, 350), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    boolean seleccion = !(configuracion.musica1Seleccionada());
                    configuracion.seleccionarMusica1(seleccion);
                    botonMusica1.seleccionar(seleccion);
                    
                    if (seleccion == true && configuracion.musica2Seleccionada() == true) {
                        configuracion.seleccionarMusica2(false);
                        botonMusica2.seleccionar(false);
                    }
                }
            }, almacen
        );
        super.nuevoElemento(this.botonMusica1);
        
        this.botonMusica2 = new BotonSwitch(
            "radiobtn-musica-2-no", super.almacen.getImagen("radiobtn-musica-2-no"), // Botón sin seleccionar
            "radiobtn-musica-2-si", super.almacen.getImagen("radiobtn-musica-2-si"), // Botón seleccionado
            new Volumen(210, 37), // Tamaño
            new Coordenada(495, 400), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    boolean seleccion = !(configuracion.musica2Seleccionada());
                    configuracion.seleccionarMusica2(seleccion);
                    botonMusica2.seleccionar(seleccion);
                    
                    if (seleccion == true && configuracion.musica1Seleccionada() == true) {
                        configuracion.seleccionarMusica1(false);
                        botonMusica1.seleccionar(false);
                    }
                }
            }, almacen
        );
        super.nuevoElemento(this.botonMusica2);
        
        this.botonImagen1 = new BotonSwitch(
            "radiobtn-imagen-1-no", super.almacen.getImagen("radiobtn-imagen-1-no"), // Botón sin seleccionar
            "radiobtn-imagen-1-si", super.almacen.getImagen("radiobtn-imagen-1-si"), // Botón seleccionado
            new Volumen(210, 37), // Tamaño
            new Coordenada(495, 530), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    boolean seleccion = !(configuracion.imagen1Seleccionada());
                    configuracion.seleccionarImagen1(seleccion);
                    botonImagen1.seleccionar(seleccion);
                    
                    if (seleccion == true && configuracion.imagen2Seleccionada() == true) {
                        configuracion.seleccionarImagen2(false);
                        botonImagen2.seleccionar(false);
                    }
                }
            }, almacen
        );
        super.nuevoElemento(this.botonImagen1);
        
        this.botonImagen2 = new BotonSwitch(
            "radiobtn-imagen-2-no", super.almacen.getImagen("radiobtn-imagen-2-no"), // Botón sin seleccionar
            "radiobtn-imagen-2-si", super.almacen.getImagen("radiobtn-imagen-2-si"), // Botón seleccionado
            new Volumen(210, 37), // Tamaño
            new Coordenada(495, 580), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    boolean seleccion = !(configuracion.imagen2Seleccionada());
                    configuracion.seleccionarImagen2(seleccion);
                    botonImagen2.seleccionar(seleccion);
                    
                    if (seleccion == true && configuracion.imagen1Seleccionada() == true) {
                        configuracion.seleccionarImagen1(false);
                        botonImagen1.seleccionar(false);
                    }
                }
            }, almacen
        );
        super.nuevoElemento(this.botonImagen2);
        
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
                }
            }, almacen
        );
        super.nuevoElemento(this.botonMenu);
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * los distintos elementos de configuración que admite el programa.
     */
    @Override
    public void mostrar() {
        // Cargamos la vista por defecto
        super.mostrar();
        
        // Mostramos los botones
        botonMusica1.mostrar();
        botonMusica2.mostrar();
        botonImagen1.mostrar();
        botonImagen2.mostrar();
        botonMenu.mostrar();
        
        // Mostramos los textos de configuración
        fill(paletaColores.azul); // Color del texto
        textSize(24); // Tamaño del texto
        text(
            "Música", // Texto
            560,  // Posición X
            320  // Posición Y
        );
        
        fill(paletaColores.azul); // Color del texto
        textSize(24); // Tamaño del texto
        text(
            "Imagen", // Texto
            560,  // Posición X
            500  // Posición Y
        );
    }
    
    /*
     * Método que implementa para Pantalla para devolver el nombre identificador de ésta Pantalla.
     */
    @Override
    public String getIdPantalla() {
        return "Configuracion";
    }
}

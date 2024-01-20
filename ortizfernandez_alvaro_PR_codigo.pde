/*
 * Declaración de variables que usaremos en el programa
 */
Reloj reloj;
Navegacion navegacion;
AlmacenRecursos almacen;
PaletaColores paletaColores;
Configuracion configuracion;

/*
 * Método inicial invocado por Processing al arrancar el programa
 */
void setup() {
    // Iniciamos la ventana del programa
    size(1200, 1000); // Anchura y altura
    
    // Refresco (fps / Frames Per Second/ Imágenes por segundo)
    frameRate(60);
    
    // Inicializamos las variables
    reloj = new Reloj(frameRate);
    navegacion = new Navegacion();
    almacen = new AlmacenRecursos(this);
    paletaColores = new PaletaColores();
    configuracion = new Configuracion(almacen);
    
    // Creamos la pantalla de carga
    navegacion.nuevaPantalla(new PantallaCarga(
        new Volumen(1200, 1000), // Anchura y altura
        reloj, almacen, configuracion, navegacion, paletaColores
    ));
    
    // Establecemos la pantalla de carga
    navegacion.establecerPantalla("Carga");
}

/*
 * Método principal que se invoca después de setup().
 * Se invoca en bucle hasta que se cierre la ventana, es lo que permite crear animaciones.
 */
void draw() {
    // Avanzamos el reloj en cada frame
    reloj.incrementar();
    
    // Mostramos la pantalla actual
    navegacion.mostrarPantalla();
}

/*
 * Método invocado por processing cuando se hace click sobre el ratón.
 */
void mousePressed() {
    this.navegacion.mouseActivado();
}

/*
 * Método que usamos para iniciar la carga de recursos externos.
 */
void iniciarCarga() {
    almacen.cargar();
}

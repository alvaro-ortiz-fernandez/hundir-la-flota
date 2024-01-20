/*
 * Clase base que contiene la lógica compartida por los diferentes campos
 * que participan en el proceso del juego de hundir la flota.
 */
public abstract class CampoJuego extends ElementoInterfaz {
  
    // Campos de la clase
    protected final Coordenada posicionVidas;
    protected final AlmacenRecursos almacen;
    protected final PaletaColores paletaColores;
    protected final ArrayList<Barco> barcos;
    protected final HashMap<String, Celda> celdas;
    protected Dificultad dificultad;
    protected boolean turnoActivo;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public CampoJuego(Volumen volumen, Coordenada posicion, Coordenada posicionVidas,
            AlmacenRecursos almacen, PaletaColores paletaColores, boolean turnoActivo) {
              
        super(volumen, posicion);
        this.posicionVidas = posicionVidas;
        this.almacen = almacen;
        this.paletaColores = paletaColores;
        this.celdas = new HashMap();
        this.barcos = new ArrayList();
        this.setTurnoActivo(turnoActivo);
    }
    
    
    /*
     * Método que establece el turno de este campo.
     */
    public void setTurnoActivo(boolean turnoActivo) {
        this.turnoActivo = turnoActivo;
        
        for (Barco barco : this.barcos)
            barco.activo(turnoActivo);
    }
    
    /*
     * Método que reinicia los componentes de este campo, con la dificultad establecida.
     */
    public void reiniciar(Dificultad dificultad) {
        super.elementos.clear();
        this.celdas.clear();
        this.barcos.clear();
        this.dificultad = dificultad;
        
        // Quitamos el turno
        this.setTurnoActivo(false);
        
        // Montamos el grid, mostrando una línea por cada columna y fila
        for (int c = 0; c < this.dificultad.getColumnas(); c++) {
            for (int f = 1; f <= this.dificultad.getFilas(); f++) {
                int posicionX = super.posicion.getPosicionHorizontal() + (c * this.getAnchoCelda());
                int posicionY = super.posicion.getPosicionVertical() + ((f - 1) * this.getAltoCelda());
                
                char letra = (char) (c + 65); // La 'A' en ASCII es el 65
                String idCelda = ("" + letra + f); // A1, F7, ...
                
                Celda celda = new Celda(
                    new Volumen(this.getAnchoCelda(), this.getAltoCelda()),
                    new Coordenada(posicionX, posicionY),
                    this.almacen, paletaColores, idCelda
                );
                this.celdas.put(idCelda, celda);
                super.nuevoElemento(celda);
            }
        }
        
        // Creamos los barcos marcados por la dificultad
        for (ConfiguracionBarco configuracion : dificultad.getConfiguraciones()) {
            for (int i = 0; i < configuracion.getNumBarcos(); i++)
                this.barcos.add(this.crearBarcoAleatorio(configuracion.getLongitud()));
        }
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * la rejilla base del campo.
     */
    @Override
    public void mostrar() {
        strokeWeight(1);
            
        // Pintamos el grid
        for (Celda celda : this.celdas.values())
            celda.mostrar(this.turnoActivo);
        
        textSize(14); // Tamaño del texto
        
        // Establecemos el color del texto en base al turno activo
        if (this.turnoActivo)
            fill(paletaColores.negro);
        else
            fill(paletaColores.gris);
                
        // Pintamos las cabeceras de las columnas
        for (int c = 65; c < (this.dificultad.getColumnas() + 65); c++) {
            text(
                (char) c, // Texto (La 'A' en ASCII es el 65)
                this.posicion.getPosicionHorizontal() + ((this.getAnchoCelda() / 2) - 5) + ((c - 65) * this.getAnchoCelda()), // Posición X
                this.posicion.getPosicionVertical() - 15 // Posición Y
            );
        }
        
        // Pintamos las cabeceras de las filas
        for (int f = 1; f <= this.dificultad.getFilas(); f++) {
            text(
                f, // Texto
                this.posicion.getPosicionHorizontal() - ((f > 9) ? 33 : 28), // Posición X
                this.posicion.getPosicionVertical() - ((this.getAltoCelda() / 2) - 5) + (f * this.getAltoCelda()) // Posición Y
            );
        }
        
        // Pintamos las vidas de los barcos
        int y = this.posicionVidas.getPosicionVertical();
        float anchura = this.getAnchoCelda() / 5;
        float altura = this.getAltoCelda() / 5;
        
        noStroke();
        for (Barco barco : this.barcos) {
            int x = this.posicionVidas.getPosicionHorizontal();
        
            for (Celda celda : barco.getCeldas()) {
              if (celda.seleccionada()) {
                  if (this.turnoActivo) {
                      fill(this.paletaColores.rojo); // Color de fondo
                  } else {
                      fill(this.paletaColores.rojo, 120); // Color de fondo
                  }
              } else {
                  if (this.turnoActivo) {
                      fill(this.paletaColores.azul); // Color de fondo
                  } else {
                      fill(this.paletaColores.azul, 120); // Color de fondo
                  }
              }
              
                rect(
                    x, // Posición X
                    y, // Posición Y
                    anchura,
                    altura
                );
                
                x += (anchura + (anchura / 3));
            }
            
            y += (altura * 3);
        }
    }
    
    /*
     * Método que obtiene una celda aleatoria del grid
     */
    public Celda obtenerCeldaAleatoria() {
        int letra = int(random(65, (this.dificultad.getColumnas() + 65)));
        int num = int(random(1, this.dificultad.getFilas()));
        return this.celdas.get(("" + ((char) letra) + num));
    }
    
    /*
     * Método que indica si todos los barcos de este campo se encuentran hundidos.
     */
    public boolean hundido() {
        return this.barcos.stream()
                .allMatch(barco -> barco.hundido());
    }
    
    /*
     * Método que devuelve el ancho de las celdas de este campo.
     */
    public int getAnchoCelda() {
        if (this.dificultad == null)
            return 0;
        
        return super.volumen.getAnchura() / this.dificultad.getColumnas();
    }
    
    /*
     * Método que devuelve el alto de las celdas de este campo.
     */
    public int getAltoCelda() {
        if (this.dificultad == null)
            return 0;
            
        return super.volumen.getAltura() / this.dificultad.getFilas();
    }
    
    /*
     * Método que crea un barco con la longitud indicada y en una posición aleatoria.
     */
    protected Barco crearBarcoAleatorio(int longitud) {
        // Cogemos una celda aleatoria para como posición inicial del barco
        int letra = int(random(65, (this.dificultad.getColumnas() + 65)));
        int num = int(random(1, this.dificultad.getFilas()));
        Celda celdaInicial = this.celdas.get(("" + ((char) letra) + num));
      
        Barco barco;
      
        // Si la longitud es de 1, creamos el barco sólo con ésta celda
        if (longitud == 1) {
            barco = new Barco(celdaInicial.getVolumen(), celdaInicial.getPosicion(), this.paletaColores, 0);
            barco.asignarCelda(celdaInicial);
            
        } else {
            // Si la longitud es de varias celdas, extendemos aleatoriamente la celda inicial
            int direccion = int(random(0, 4));
            
            if (direccion < 1) {
                // Hacia arriba
                if ((num - longitud) < 0)
                    return crearBarcoAleatorio(longitud);
                
                barco = new Barco(
                    new Volumen(
                        celdaInicial.getVolumen().getAnchura(),
                        celdaInicial.getVolumen().getAltura() * longitud
                    ),
                    celdaInicial.getPosicion(), this.paletaColores, direccion
                );
                barco.asignarCelda(celdaInicial);
                
                for (int i = 1; i < longitud; i++)
                    barco.asignarCelda(this.celdas.get(("" + ((char) letra) + (num - i))));
                
            } else if (direccion < 2) {
                // Hacia la derecha
                if ((num + longitud - 1) > this.dificultad.getColumnas())
                    return crearBarcoAleatorio(longitud);
                    
                barco = new Barco(
                    new Volumen(
                        celdaInicial.getVolumen().getAnchura() * longitud,
                        celdaInicial.getVolumen().getAltura()
                    ),
                    celdaInicial.getPosicion(), this.paletaColores, direccion
                );
                barco.asignarCelda(celdaInicial);
                
                for (int i = 1; i < longitud; i++)
                    barco.asignarCelda(this.celdas.get(("" + ((char) (letra + i)) + num)));
                
            } else if (direccion < 3) {
                // Hacia abajo
                if ((num + longitud - 1) > this.dificultad.getFilas())
                    return crearBarcoAleatorio(longitud);
                    
                barco = new Barco(
                    new Volumen(
                        celdaInicial.getVolumen().getAnchura(),
                        celdaInicial.getVolumen().getAltura() * longitud
                    ),
                    celdaInicial.getPosicion(), this.paletaColores, direccion
                );
                barco.asignarCelda(celdaInicial);
                
                for (int i = 1; i < longitud; i++) 
                    barco.asignarCelda(this.celdas.get(("" + ((char) letra) + (num + i))));
                
            } else {
                // Hacia la izquierda
                if ((num - longitud) < 0)
                    return crearBarcoAleatorio(longitud);
                    
                barco = new Barco(
                    new Volumen(
                        celdaInicial.getVolumen().getAnchura() * longitud,
                        celdaInicial.getVolumen().getAltura()
                    ),
                    celdaInicial.getPosicion(), this.paletaColores, direccion
                );
                barco.asignarCelda(celdaInicial);
                
                for (int i = 1; i < longitud; i++) 
                    barco.asignarCelda(this.celdas.get(("" + ((char) (letra - i)) + num)));
            }
        }
        
        // Comprobamos si se ha asignado una celda fuera del grid, por extender el barco fuera del límite.
        // Si es así, invocamos recursívamente este método de nuevo para crear otro barco hasta que se cree uno válido
        if (barco.getCeldas().stream().anyMatch(celda -> celda == null))
            return crearBarcoAleatorio(longitud);
            
        // Comprobamos también que este barco no ocupe una celda ocupada por otro barco.
        // Si es así, invocamos recursívamente este método también
        if (this.barcos.stream().anyMatch(b -> b.colisiona(barco)))
            return crearBarcoAleatorio(longitud);
            
        // Si todo es correcto, devolvemos el barco creado
        return barco;
    }
}

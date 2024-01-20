/*
 * Clase encargada de gestionar el proceso del juego de hundir la flota.
 */
public class Juego extends ElementoInterfaz {
  
    // Campos de la clase
    private final CampoPropio campoPropio;
    private final CampoContrincante campoContrincante;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Juego(Volumen volumen, Coordenada posicion, final Reloj reloj,
            AlmacenRecursos almacen, PaletaColores paletaColores) {
        super(volumen, posicion);
        
        this.campoPropio = new CampoPropio(
            new Volumen(360, 360),
            new Coordenada(160, 160),
            almacen, paletaColores, false
        );
        super.nuevoElemento(this.campoPropio);
        
        this.campoContrincante = new CampoContrincante(
            new Volumen(360, 360),
            new Coordenada(680, 160),
            almacen, paletaColores, true,
            // Acción a ejecutar cuando se active una celda del campo contrincante
            new Runnable() {
                @Override
                public void run() {
                    // Si se han hundido todos los barcos de algún campo, revocamos el turno a ambos
                    if (campoPropio.hundido() || campoContrincante.hundido()) {
                        campoPropio.setTurnoActivo(false);
                        campoContrincante.setTurnoActivo(false);
                    } else {
                        // Cambiamos los turnos
                        campoPropio.setTurnoActivo(true);
                        campoContrincante.setTurnoActivo(false);
                                
                        // Programamos la tarea, para simular una espera aleatoria de 0.5s - 2s
                        reloj.programarTarea(new Runnable() {
                            @Override
                            public void run() {
                                // Hacemos que el otro jugador (el ordenador) seleccione
                                // una celda cualquiera que no haya sido seleccionada aún
                                Celda celda = campoPropio.obtenerCeldaAleatoria();
                                
                                while (celda.seleccionada() == true)
                                    celda = campoPropio.obtenerCeldaAleatoria();
                            
                                celda.seleccionar();
                                
                                // Cambiamos los turnos
                                campoPropio.setTurnoActivo(false);
                                campoContrincante.setTurnoActivo(true);
                            }
                        }, random(0.5, 2));
                    }
                }
            }
        );
        
        super.nuevoElemento(this.campoContrincante);
        
        this.reiniciar();
    }
    
    
    /*
     * Método que devuelve el campo del jugador.
     */
    public CampoPropio getCampoPropio() {
        return this.campoPropio;
    }
    
    /*
     * Método que devuelve el campo del ordenador.
     */
    public CampoContrincante getCampoContrincante() {
        return this.campoContrincante;
    }
    
    /**
     * Método que arranca los elementos necesarios para cada juego de cero.
     */
    public void reiniciar() {
        // Creamos una dificultad aleatoria
        Dificultad dificultad = new Dificultad();
      
        this.campoPropio.reiniciar(dificultad);
        this.campoContrincante.reiniciar(dificultad);
        this.campoContrincante.setTurnoActivo(true);
    }
    
    /*
     * Método que indica si el juego ha finalizado.
     */
    public boolean finalizado() {
        return this.campoPropio.hundido() || this.campoContrincante.hundido();
    }
    
    /*
     * Método que extiende de CampoJuego en el que mostramos
     * los elementos adicionales de este tipo de campo.
     */
    @Override
    public void mostrar() {
        // Mostramos los campos de juego
        this.campoPropio.mostrar();
        this.campoContrincante.mostrar();
    }
}

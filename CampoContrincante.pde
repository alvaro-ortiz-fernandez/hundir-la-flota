/*
 * Clase para representar el campo de oponente (ordenador) en el juego de hundir la flota.
 */
public class CampoContrincante extends CampoJuego {
  
    private final Runnable turnoEjecutado;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public CampoContrincante(Volumen volumen, Coordenada posicion, AlmacenRecursos almacen,
            PaletaColores paletaColores, boolean turnoActivo, final Runnable turnoEjecutado) {
        
        super(volumen, posicion, new Coordenada(posicion.getPosicionHorizontal() + volumen.getAnchura() + 50, posicion.getPosicionVertical()),
            almacen, paletaColores, turnoActivo);
        this.turnoEjecutado = turnoEjecutado;
    }
    
    
    /*
     * Método que sobrescribe el establecimiento del turno activo.
     */
    @Override
    public void setTurnoActivo(boolean turnoActivo) {
        super.setTurnoActivo(turnoActivo);
        
        for (final Celda celda : super.celdas.values()) {
            celda.setAccion(new Runnable() {
                @Override
                public void run() {
                    // Sólo establecemos la acción de las celda si se habilita el turno,
                    // en caso contrario las deshabilitamos
                    if (turnoActivo) {
                        celda.seleccionar();
                        turnoEjecutado.run();
                    }
                }
            });
        }
    }
    
    /*
     * Método que extiende de CampoJuego en el que mostramos
     * los elementos adicionales de este tipo de campo.
     */
    @Override
    public void mostrar() {
        // Invocamos primero los compentes del campo base
        super.mostrar();
        
        // Mostramos los componentes propios de este campo
        textSize(14);
        
        // Establecemos el color del texto en base al turno activo
        if (this.turnoActivo)
            fill(paletaColores.negro);
        else
            fill(paletaColores.gris);
            
        text(
            "Campo de su contrincante", // Texto
            this.posicion.getPosicionHorizontal() + 105,                        // Posición X
            this.posicion.getPosicionVertical() + this.volumen.getAltura() + 35 // Posición Y
        );
        
        // Si el campo tiene el turno activo, remarcamos la celda
        // sobre la que se encuentre el puntero (si se da el caso)
        if (super.turnoActivo) {
            for (Celda celda : super.celdas.values()) {
                if (celda.mouseIn() && !celda.seleccionada()) {
                    strokeWeight(3); // Grosor de trazado
                    stroke(this.paletaColores.naranja); // Color de trazado
                    fill(this.paletaColores.naranja, 30); // Color de fondo
                    rect(
                        celda.getPosicion().getPosicionHorizontal(), // Posición X
                        celda.getPosicion().getPosicionVertical(),   // Posición Y
                        this.getAnchoCelda(), // Anchura
                        this.getAltoCelda()   // Altura
                    );
                }
            }
        }
        
        // Mostramos los barcos hundidos
        for (Barco barco : super.barcos) {
            if (barco.hundido())
                barco.mostrar();
            
            // Pintamos las celdas de barco hundidas
            for (Celda celdaBarco : barco.getCeldas()) {
                if (celdaBarco.seleccionada()) {
                    for (Celda celdaGrid : super.celdas.values()) {
                        if (celdaGrid.seleccionada() && celdaGrid.getId().equalsIgnoreCase(celdaBarco.getId())) {
                            strokeWeight(2); // Grosor de trazado
                            
                            if (super.turnoActivo)
                                stroke(this.paletaColores.rojo); // Color de trazado
                            else
                                stroke(this.paletaColores.rojo, 120); // Color de trazado
                            
                            line(
                                celdaGrid.getPosicion().getPosicionHorizontal(), // Posición X del 1º Vértice
                                celdaGrid.getPosicion().getPosicionVertical(),   // Posición Y del 1º Vértice
                                celdaGrid.getPosicion().getPosicionHorizontal() + celdaGrid.getVolumen().getAnchura(), // Posición X del 2º Vértice
                                celdaGrid.getPosicion().getPosicionVertical() + celdaGrid.getVolumen().getAltura()     // Posición Y del 2º Vértice
                            );
                            line(
                                celdaGrid.getPosicion().getPosicionHorizontal() + celdaGrid.getVolumen().getAnchura(), // Posición X del 1º Vértice
                                celdaGrid.getPosicion().getPosicionVertical(),                                         // Posición Y del 1º Vértice
                                celdaGrid.getPosicion().getPosicionHorizontal(),                                   // Posición X del 2º Vértice
                                celdaGrid.getPosicion().getPosicionVertical() + celdaGrid.getVolumen().getAltura() // Posición Y del 2º Vértice
                            );
                        }
                    }
                }
            }
        }
    }
}

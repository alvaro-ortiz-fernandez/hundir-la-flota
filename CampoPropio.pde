/*
 * Clase para representar el campo del jugador en el juego de hundir la flota.
 */
public class CampoPropio extends CampoJuego {
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public CampoPropio(Volumen volumen, Coordenada posicion, AlmacenRecursos almacen,
            PaletaColores paletaColores, boolean turnoActivo) {
        super(volumen, posicion, new Coordenada(posicion.getPosicionHorizontal() - 100, posicion.getPosicionVertical()),
            almacen, paletaColores, turnoActivo);
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
            "Su campo", // Texto
            this.posicion.getPosicionHorizontal() + 150,                        // Posición X
            this.posicion.getPosicionVertical() + this.volumen.getAltura() + 35 // Posición Y
        );
        
        // Mostramos los barcos
        for (Barco barco : super.barcos) {
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

/*
 * Clase para representar un aviso de carga.
 */
public class Spinner extends ElementoInterfaz {
  
    // Campos de la clase
    private final PaletaColores paletaColores;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Spinner(Volumen volumen, Coordenada posicion, PaletaColores paletaColores) {
        super(volumen, posicion);
        this.paletaColores = paletaColores;
    }
    
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos el aviso de carga.
     */
    @Override
    public void mostrar() {
        noStroke(); // Deshabilitamos los bordes
        
        int numCirculos = 8;
        float tiempo = millis() * 0.006;
        int radio = (super.volumen.getAnchura() + super.volumen.getAltura()) / 20;
        int centerX = super.posicion.getPosicionHorizontal() + super.volumen.getAnchura() / 2;
        int centerY = super.posicion.getPosicionVertical();
        
        for (int i = 0; i < numCirculos; i++) {
            float angulo = map(i, 0, numCirculos, 0, TWO_PI); // Calculamos el ángulo basado en el índice
            float x = centerX + cos(angulo) * radio * 2; // Calculamos la posición X usando coordenadas polares
            float y = centerY + sin(angulo) * radio * 2; // Calculamos la posición Y usando coordenadas polares
            
            float alpha = map(sin(tiempo - angulo), -1, 1, 100, 255); // Calculamos la opacidad en función del tiempo y el ángulo
            
            fill(this.paletaColores.azul, alpha);
            circle(x, y, radio);
        }
    }
}

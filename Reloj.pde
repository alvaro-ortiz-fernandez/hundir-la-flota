/*
 * Clase para controlar las funcionalidades relativas a gestión de tiempos.
 */
public class Reloj {
   
    // Campos de la clase
    private float fps; // Fotogramas por segundo
    private float tiempo; // Instante actual del programa
    private final HashMap<Float, Runnable> tareasPorgramadas;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Reloj(float fps) {
        this.fps = fps;
        this.tiempo = 0.0; // El tiempo comienza a 0
        this.tareasPorgramadas = new HashMap<Float, Runnable>();
    }
    
    /*
     * Método que devuelve el instante actual del programa.
     */
    public float getTiempo() {
        return this.tiempo;
    }
    
    /*
     * Método que devuelve el instante actual del programa
     * redondeado al número de decimales indicado.
     */
    public String getTiempoRedondeado(int decimales) {
        // Definimos con nf() que no formatee los dígitos enteros (2º parámetro)
        // y que redondee los N decimales (3º parámetro)
        return nf(this.tiempo, 0, decimales);
    }
    
    /*
     * Método que avanza el tiempo del reloj.
     * Lo hace en base a los fps, para simular un reloj real.
     */
    public void incrementar() {
        // Sumamos la porción de un segundo
        // correspondiente a los fps del programa
        this.tiempo += (1.0 / this.fps);
        
        // Comprobamos si hay tareas a ejecutar
        this.ejecutarTareas();
    }
    
    /*
     * Método que establece a 0 el tiempo.
     */
    public void resetear() {
        this.tiempo = 0.0;
    }
    
    /*
     * Método que ejecuta la acción indicada tras pasar los segundos indicados
     * desde el momento actual.
     */
    public void programarTarea(Runnable accion, float segundos) {
        // Establecemos el momento a ejecutar la acción N segundos después
        // del momento actual
        float instanteEjecucion = this.tiempo + segundos;
        
        // Añadimos la acción a la colección
        this.tareasPorgramadas.put(instanteEjecucion, accion);
    }
    
    /*
     * Método que revisa y ejecuta (si existen y han alcanzado el tiempo indicado)
     * las tareas programadas.
     */
    private void ejecutarTareas() {
        for (HashMap.Entry<Float, Runnable> tarea : tareasPorgramadas.entrySet()) {
            float instanteEjecucion = tarea.getKey();
            Runnable accion = tarea.getValue();
          
            // Si se ha alcanzado el tiempo programado para la tarea,
            // la ejecutamos y la quitamos de la colección
            if (this.tiempo >= instanteEjecucion) {
                accion.run();
                tareasPorgramadas.remove(instanteEjecucion);
            }
        }
    }
}

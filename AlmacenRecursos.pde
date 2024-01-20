/*
 * Clase para implementar la carga en memoria de los recursos externos que emplea el programa.
 */
public class AlmacenRecursos {
  
    // Campos de la clase
    private final ortizfernandez_alvaro_PR_codigo sketch;
    private HashMap<String, PImage> imagenes;
    private HashMap<String, SoundFile> sonidos;
    private HashMap<String, SoundFile> efectos;
    private int pesoTotal;
    private int pesoCargado;
    
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public AlmacenRecursos(ortizfernandez_alvaro_PR_codigo sketch) {
        this.sketch = sketch;
        this.pesoTotal = getPesoDirectorio("data");
        this.pesoCargado = 0;
        
        // Invocamos la carga de recursos en un hilo secundario,
        // para que se ejecute en segundo plano.
        // De este modo evitamos que se congele el programa.
        thread("iniciarCarga");
    }
    
    
    /*
     * Método que indica si el almacén ha finalizado la carga de recursos.
     */
    public boolean cargado() {
        return this.imagenes != null && this.sonidos != null && this.efectos != null;
    }
    
    /*
     * Método que indica el porcentaje de peso cargado actualmente.
     */
    public int porcentajeCarga() {
        return floor((100.0 / pesoTotal) * pesoCargado);
    }
    
    /*
     * Método que devuelve la imagen indicada.
     * Antes, debe de asegurarse que el almacén ya se encuentre cargado.
     */
    public PImage getImagen(String id) {
        if (this.imagenes != null)
            return this.imagenes.get(id);
        else
            return null;
    }
    
    /*
     * Método que devuelve la imagen indicada.
     * Antes, debe de asegurarse que el almacén ya se encuentre cargado.
     */
    public SoundFile getSonido(String id) {
        return this.sonidos.get(id);
    }
    
    /*
     * Método que devuelve un efecto de sonido aleatorio.
     * Antes, debe de asegurarse que el almacén ya se encuentre cargado.
     */
    public SoundFile getEfecto() {
        return this.efectos.get(str(floor(random(1, 38))));
    }
    
    /*
     * Método que carga en segundo plano los recursos externos.
     */
    public void cargar() {
        HashMap<String, PImage> images = new HashMap<String, PImage>();
        HashMap<String, SoundFile> sounds = new HashMap<String, SoundFile>();
        HashMap<String, SoundFile> effects = new HashMap<String, SoundFile>();
        
        // Cargamos las imágenes
        images.put("background-green", this.cargarImagen("data/img/background-green.jpg"));
        images.put("background-yellow", this.cargarImagen("data/img/background-yellow.jpg"));
        images.put("btn-configuracion", this.cargarImagen("data/img/btn-configuracion.jpg"));
        images.put("btn-configuracion-hover", this.cargarImagen("data/img/btn-configuracion-hover.jpg"));
        images.put("btn-jugar", this.cargarImagen("data/img/btn-jugar.jpg"));
        images.put("btn-jugar-hover", this.cargarImagen("data/img/btn-jugar-hover.jpg"));
        images.put("btn-salir", this.cargarImagen("data/img/btn-salir.jpg"));
        images.put("btn-salir-hover", this.cargarImagen("data/img/btn-salir-hover.jpg"));
        images.put("btn-volver", this.cargarImagen("data/img/btn-volver.jpg"));
        images.put("btn-volver-hover", this.cargarImagen("data/img/btn-volver-hover.jpg"));
        images.put("radiobtn-imagen-1-no", this.cargarImagen("data/img/radiobtn-imagen-1-no.jpg"));
        images.put("radiobtn-imagen-1-si", this.cargarImagen("data/img/radiobtn-imagen-1-si.jpg"));
        images.put("radiobtn-imagen-2-no", this.cargarImagen("data/img/radiobtn-imagen-2-no.jpg"));
        images.put("radiobtn-imagen-2-si", this.cargarImagen("data/img/radiobtn-imagen-2-si.jpg"));
        images.put("radiobtn-musica-1-no", this.cargarImagen("data/img/radiobtn-musica-1-no.jpg"));
        images.put("radiobtn-musica-1-si", this.cargarImagen("data/img/radiobtn-musica-1-si.jpg"));
        images.put("radiobtn-musica-2-no", this.cargarImagen("data/img/radiobtn-musica-2-no.jpg"));
        images.put("radiobtn-musica-2-si", this.cargarImagen("data/img/radiobtn-musica-2-si.jpg"));
        
        // Cargamos los sonidos
        sounds.put("sound1", this.cargarSonido("data/sound/sound1.mp3"));
        sounds.put("sound2", this.cargarSonido("data/sound/sound2.mp3"));
        
        // Cargamos los efectos
        effects.put("1", this.cargarSonido("data/sound/effects/1.mp3"));
        effects.put("2", this.cargarSonido("data/sound/effects/2.mp3"));
        effects.put("3", this.cargarSonido("data/sound/effects/3.mp3"));
        effects.put("4", this.cargarSonido("data/sound/effects/4.mp3"));
        effects.put("5", this.cargarSonido("data/sound/effects/5.mp3"));
        effects.put("6", this.cargarSonido("data/sound/effects/6.mp3"));
        effects.put("7", this.cargarSonido("data/sound/effects/7.mp3"));
        effects.put("8", this.cargarSonido("data/sound/effects/8.mp3"));
        effects.put("9", this.cargarSonido("data/sound/effects/9.mp3"));
        effects.put("10", this.cargarSonido("data/sound/effects/10.mp3"));
        effects.put("11", this.cargarSonido("data/sound/effects/11.mp3"));
        effects.put("12", this.cargarSonido("data/sound/effects/12.mp3"));
        effects.put("13", this.cargarSonido("data/sound/effects/13.mp3"));
        effects.put("14", this.cargarSonido("data/sound/effects/14.mp3"));
        effects.put("15", this.cargarSonido("data/sound/effects/15.mp3"));
        effects.put("16", this.cargarSonido("data/sound/effects/16.mp3"));
        effects.put("17", this.cargarSonido("data/sound/effects/17.mp3"));
        effects.put("18", this.cargarSonido("data/sound/effects/18.mp3"));
        effects.put("19", this.cargarSonido("data/sound/effects/19.mp3"));
        effects.put("20", this.cargarSonido("data/sound/effects/20.mp3"));
        effects.put("21", this.cargarSonido("data/sound/effects/21.mp3"));
        effects.put("22", this.cargarSonido("data/sound/effects/22.mp3"));
        effects.put("23", this.cargarSonido("data/sound/effects/23.mp3"));
        effects.put("24", this.cargarSonido("data/sound/effects/24.mp3"));
        effects.put("25", this.cargarSonido("data/sound/effects/25.mp3"));
        effects.put("26", this.cargarSonido("data/sound/effects/26.mp3"));
        effects.put("27", this.cargarSonido("data/sound/effects/27.mp3"));
        effects.put("28", this.cargarSonido("data/sound/effects/28.mp3"));
        effects.put("29", this.cargarSonido("data/sound/effects/29.mp3"));
        effects.put("30", this.cargarSonido("data/sound/effects/30.mp3"));
        effects.put("31", this.cargarSonido("data/sound/effects/31.mp3"));
        effects.put("32", this.cargarSonido("data/sound/effects/32.mp3"));
        effects.put("33", this.cargarSonido("data/sound/effects/33.mp3"));
        effects.put("34", this.cargarSonido("data/sound/effects/34.mp3"));
        effects.put("35", this.cargarSonido("data/sound/effects/35.mp3"));
        effects.put("36", this.cargarSonido("data/sound/effects/36.mp3"));
        effects.put("37", this.cargarSonido("data/sound/effects/37.mp3"));
        
        // Asignamos el valor a las variables de la clase
        this.imagenes = images;
        this.sonidos = sounds;
        this.efectos = effects;
    }
    
    /*
     * Método que carga el fichero de imagen indicado.
     */
    private PImage cargarImagen(String ruta) {
        PImage imagen = loadImage(ruta);
        this.pesoCargado += this.getPesoFichero(ruta);
      
        return imagen;
    }
    
    /*
     * Método que carga el fichero de sonido indicado.
     */
    private SoundFile cargarSonido(String ruta) {
        SoundFile sonido = new SoundFile(this.sketch, ruta);
        this.pesoCargado += this.getPesoFichero(ruta);
      
        return sonido;
    }
    
    /*
     * Método que calcula el peso del fichero indicado.
     */
    private int getPesoFichero(String ruta) {
        String nombreDirectorio = ruta.substring(0, ruta.lastIndexOf("/"));
        String nombreFichero = ruta.substring(ruta.lastIndexOf("/") + 1, ruta.length());
        
        int peso = 0;
        File[] files = listFiles(nombreDirectorio);
        for (int i = 0; i < files.length; i++) {
            File file = files[i];
            
            if (!file.isDirectory() && file.getName() != null
                  && file.getName().equalsIgnoreCase(nombreFichero))
                peso += file.length();
        }
        
        return peso;
    }
    
    /*
     * Método que calcula el peso del directorio indicado.
     */
    private int getPesoDirectorio(String directorio) {
        int peso = 0;
        
        File[] files = listFiles(directorio);
        for (int i = 0; i < files.length; i++) {
            File file = files[i];
            
            if (!file.isDirectory())
                peso += file.length();
            else
                peso += getPesoDirectorio(directorio + "/" + file.getName());
        }
        
        return peso;
    }
}

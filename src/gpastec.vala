namespace GPaste {

    [DBus (name = "org.gnome.GPaste", signature = "as")]
    interface GPastec : Object {
        public abstract string[] getHistory() throws IOError;
    }

    public static int main() {
        try {
            GPastec gpastec = Bus.get_proxy_sync(BusType.SESSION, "org.gnome.GPaste", "/org/gnome/gpaste");
            string[] history = gpastec.getHistory();
            for (int i = 0 ; i < history.length ; ++i)
                stdout.printf("\n%d:\n%s\n\n", i+1, history[i]);
        } catch (IOError e) {
            stderr.printf("%s\n", e.message);
        }
        return 0;
    }

}
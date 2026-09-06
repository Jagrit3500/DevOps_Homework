import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class Main {
    public static void main(String[] args) throws IOException {
        int port = 8080;
        HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
        
        server.createContext("/", new HttpHandler() {
            @Override
            public void handle(HttpExchange exchange) throws IOException {
                String response = "<!DOCTYPE html>" +
                        "<html lang='en'>" +
                        "<head>" +
                        "  <meta charset='UTF-8'>" +
                        "  <title>Hello World - Java</title>" +
                        "  <style>" +
                        "    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background: #0f172a; color: #f8fafc; }" +
                        "    .card { text-align: center; padding: 2.5rem; background: #1e293b; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.5); border: 1px solid #334155; }" +
                        "    h1 { color: #f97316; margin-bottom: 0.5rem; }" +
                        "    p { color: #94a3b8; font-size: 1.1rem; }" +
                        "    .badge { display: inline-block; background: #ea580c; color: white; padding: 4px 12px; border-radius: 9999px; font-size: 0.85rem; font-weight: 600; margin-top: 1rem; }" +
                        "  </style>" +
                        "</head>" +
                        "<body>" +
                        "  <div class='card'>" +
                        "    <h1>☕ Hello World from Java!</h1>" +
                        "    <p>Containerized successfully using Docker.</p>" +
                        "    <span class='badge'>Java HTTP Server • Port 8080</span>" +
                        "  </div>" +
                        "</body>" +
                        "</html>";

                byte[] bytes = response.getBytes("UTF-8");
                exchange.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
                exchange.sendResponseHeaders(200, bytes.length);
                OutputStream os = exchange.getResponseBody();
                os.write(bytes);
                os.close();
            }
        });

        server.setExecutor(null);
        System.out.println("Java HTTP Server running on http://0.0.0.0:" + port);
        server.start();
    }
}

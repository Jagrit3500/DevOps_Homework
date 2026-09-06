const http = require('http');

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.end(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>Hello World - Node.js</title>
      <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background: #0f172a; color: #f8fafc; }
        .card { text-align: center; padding: 2.5rem; background: #1e293b; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.5); border: 1px solid #334155; }
        h1 { color: #38bdf8; margin-bottom: 0.5rem; }
        p { color: #94a3b8; font-size: 1.1rem; }
        .badge { display: inline-block; background: #0284c7; color: white; padding: 4px 12px; border-radius: 9999px; font-size: 0.85rem; font-weight: 600; margin-top: 1rem; }
      </style>
    </head>
    <body>
      <div class="card">
        <h1>👋 Hello World from Node.js!</h1>
        <p>Containerized successfully using Docker.</p>
        <span class="badge">Node.js Web App • Port ${PORT}</span>
      </div>
    </body>
    </html>
  `);
});

server.listen(PORT, '0.0.0.0', () => {
  console.log(`Node.js Hello World server running on http://0.0.0.0:${PORT}`);
});

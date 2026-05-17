const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

const getChapter = (req, res, filename) => {
    const ua = req.headers['user-agent'] || '';

    // If it's a browser, bypass the text stream and send them the HTML frontend
    if (!ua.toLowerCase().includes('curl')) {
        return res.sendFile(path.join(__dirname, 'views', 'index.html'));
    }

    const file = path.join(__dirname, 'guide', filename);
    
    fs.readFile(file, 'utf8', (err, data) => {
        if (err) {
            res.setHeader('Content-Type', 'text/plain; charset=utf-8');
            return res.status(404).send('\x1b[1;31m[!] Chapter file not found.\x1b[0m\n');
        }

        // Convert literal backslash escape strings to raw executable bytes for curl
        const text = data.replace(/\\x1b/g, '\x1b');

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        res.send(text);
    });
};

// Application Routing Matrix
app.get('/', (req, res) => getChapter(req, res, 'intro.md'));
app.get('/ch1', (req, res) => getChapter(req, res, 'ch1_prep.md'));
app.get('/ch2', (req, res) => getChapter(req, res, 'ch2_config.md'));
app.get('/ch3', (req, res) => getChapter(req, res, 'ch3_compile.md'));
app.get('/ch4', (req, res) => getChapter(req, res, 'ch4_bash.md'));
app.get('/ch5', (req, res) => getChapter(req, res, 'ch5_coreutils.md'));
app.get('/ch6', (req, res) => getChapter(req, res, 'ch6_util_linux.md'));
app.get('/ch7', (req, res) => getChapter(req, res, 'ch7_nano.md'));
app.get('/ch8', (req, res) => getChapter(req, res, 'ch8_glibc.md'));
app.get('/ch9', (req, res) => getChapter(req, res, 'ch9_ncurses.md'));
app.get('/ch10', (req, res) => getChapter(req, res, 'ch10_init.md'));
app.get('/ch11', (req, res) => getChapter(req, res, 'ch11_disk.md'));

app.listen(PORT, () => {
    console.log(`[+] TLKC production engine active on port ${PORT}`);
});


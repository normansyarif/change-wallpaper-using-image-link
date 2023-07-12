// take.js

'use strict';
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  try {
    const page = await browser.newPage();
    await page.goto('https://example.com');

    await page.setViewport({width: 1360, height: 768, deviceScaleFactor: 2});

    await page.screenshot({ path: 'path/to/wallpaper.jpg' });
   } catch (e) {
     console.log(e)
   } finally {
     await browser.close();
   }
})();
const { chromium } = require("playwright");
(async () => {
  let browser = await chromium.launch();

  let page = await browser.newPage();
  await page.setViewportSize({ width: 1360, height: 768 });
  await page.goto("https://www.example.com");
  await page.screenshot({ path: `wallpaper.jpg` });
  await browser.close();
})();

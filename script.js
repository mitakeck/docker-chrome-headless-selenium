const puppeteer = require('puppeteer');
const devices = require('puppeteer/DeviceDescriptors');
const iPhone = devices['iPhone 6'];

(async() => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.emulate(iPhone);
  await page.goto("http://localhost:8080");
  await page.screenshot({path: "google.com.png", fullPage: true});

  browser.close();
})();

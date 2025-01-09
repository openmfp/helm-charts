const { chromium } = require('playwright');

(async () => {
    // Launch browser
    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext();
    const page = await context.newPage();

    // Navigate to a website
    await page.goto('http://example.com/');

    // Interact with the page
    await page.click('text=More information...');

    // Close browser
    await browser.close();
})();

const { chromium } = require('playwright');

(async () => {
    // Launch browser
    const browser = await chromium.launch({ headless: false });
    const context = await browser.newContext();
    const page = await context.newPage();

    // Navigate to a website
    await page.goto('http://localhost:8000/');

    // Interact with the page
    await page.click('text=Register');
    const title = await page.title();

    // Fill in registration form
    await page.fill('input[name="email"]', 'username@sap.com');
    await page.fill('input[id="password"]', 'MyPass1234');
    await page.fill('input[id="password-confirm"]', 'MyPass1234');
    await page.fill('input[id="firstName"]', 'Firstname');
    await page.fill('input[id="lastName"]', 'Lastname');
    
    // Submit form
    await page.click('input[value="Register"]');

    // assert title="OpenMFP Portal"
    await page.waitForSelector('text=OpenMFP Portal');

    await expect(page.locator('body')).toContainText('Welcome to ApeirORA Showroom');

    await page.click('text=Accounts');

    await expect(page.locator('body')).toContainText('Demo Account');

    // Close browser
    await browser.close();
})();

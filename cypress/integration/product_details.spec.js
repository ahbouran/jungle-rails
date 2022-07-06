describe("Product Details", () => {
  it("should navigate from the home page to the product detail page by clicking on a product.", () => {
    cy.visit("/");
    cy.contains('Scented Blade')
    cy.get("[alt='Scented Blade']").click()
  });
});
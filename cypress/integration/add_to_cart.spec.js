describe("Add to Cart", () => {
  it("should navigate from the home page to the product detail page by clicking on a product.", () => {
    cy.visit("/");
    cy.contains('Scented Blade')
    cy.contains('Add')
    .click({force: true})
    cy.contains('.end-0 > .nav-link', "My Cart (1)") 
  });
});
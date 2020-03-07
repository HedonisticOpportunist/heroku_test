describe('Testing of the Meta Weather API (Invalid Date):', () => {
 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //date-related variables used throughout the test
 var bournemouth = '13383';
 var invalid_date_url = base_url + bournemouth + '/' + '0'+ '/';

 it('Invalid Date => Validate the header:', () => {
  response = cy.request({
   url: invalid_date_url,
   failOnStatusCode: false
  })
  response.its('headers')
   .its('content-type')
   .should('include', 'text/html')
 })

 it('Invalid Date => Validate the status:', () => {
  response = cy.request({
   url: invalid_date_url,
   failOnStatusCode: false
  })
  response.its('status')
   .should('equal', 404);
 })

 it('Invalid Date => Validate that the body is not empty and includes the Not Found message:', () => {
  response = cy.request({
   url: invalid_date_url,
   failOnStatusCode: false
  })
  response.its('body')
   .should('not.be.empty')
   .and('include', '<h1>404 - Page not found</h1>');
 })

})

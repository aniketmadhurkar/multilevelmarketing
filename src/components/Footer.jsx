import React from 'react'

const Footer = () => {
    return (
        <footer id="footer" class="footer bg-overlay">
 
        <div class="copyright">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="copyright-info">
                  <span>Copyright © 2023</span>
                </div>
              </div>
    
              
            </div>
    
            <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
              <button class="btn btn-primary" title="Back to Top">
                <i class="fa fa-angle-double-up"></i>
              </button>
            </div>
    
          </div>
        </div>
      </footer>
    );
};

export default Footer
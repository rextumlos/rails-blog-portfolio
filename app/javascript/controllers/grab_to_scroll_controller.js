import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="grab-to-scroll"
export default class extends Controller {
  connect() {
    document.addEventListener('DOMContentLoaded', () => {
      const container = document.querySelector('.overflow-x-scroll');
      let isDown = false;
      let startX;
      let scrollLeft;
  
      container.addEventListener('mousedown', (e) => {
          isDown = true;
          container.classList.add('grabbing');
          startX = e.pageX - container.offsetLeft;
          scrollLeft = container.scrollLeft;
      });
  
      container.addEventListener('mouseleave', () => {
          isDown = false;
          container.classList.remove('grabbing');
      });
  
      container.addEventListener('mouseup', () => {
          isDown = false;
          container.classList.remove('grabbing');
      });
  
      container.addEventListener('mousemove', (e) => {
          if (!isDown) return;
          e.preventDefault();
          const x = e.pageX - container.offsetLeft;
          const walk = (x - startX) * 1; // scroll-fast
          container.scrollLeft = scrollLeft - walk;
      });
  });
  }
}

import { Controller } from "@hotwired/stimulus"
// import { Aronnax } from 'aronnax-styles/index.js';

export default class extends Controller {
  connect() {
    // Aronnax.setTheme('sharp');
  }

  switch() {
    Aronnax.toggleMode();
  }
}

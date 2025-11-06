FOOTNOTE SYSTEM USAGE:

To add footnotes/citations to your slides:

1. Add a superscript marker in your text:
   <sup class="footnote-ref">1</sup>

2. At the bottom of the slide (before the --- separator), add:
   <div class="footnotes">
     <div class="fn-item">
       <span class="fn-num">1.</span>
       <span class="fn-text">Your citation here</span>
     </div>
   </div>

3. For multiple footnotes on one slide:
   <div class="footnotes">
     <div class="fn-item">
       <span class="fn-num">1.</span>
       <span class="fn-text">First citation</span>
     </div>
     <div class="fn-item">
       <span class="fn-num">2.</span>
       <span class="fn-text">Second citation</span>
     </div>
   </div>

Example:
This is my claim<sup class="footnote-ref">1</sup> supported by evidence<sup class="footnote-ref">2</sup>.

<div class="footnotes">
  <div class="fn-item">
    <span class="fn-num">1.</span>
    <span class="fn-text">Smith, J. (2020). Journal of Studies, 12(3), 45-67.</span>
  </div>
  <div class="fn-item">
    <span class="fn-num">2.</span>
    <span class="fn-text">Jones, A. (2021). Book Title. Publisher.</span>
  </div>
</div>
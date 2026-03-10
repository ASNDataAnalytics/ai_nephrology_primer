<script>
document.addEventListener("DOMContentLoaded", () => {
  function attachLightbox() {
    document.querySelectorAll(".three-col-grid img").forEach(img => {
      if (img.dataset.lightboxReady) return;
      img.dataset.lightboxReady = "1";

      img.addEventListener("mouseenter", () => {
        const grid = img.closest(".three-col-grid");
        grid?.classList.add("has-active");
        img.classList.add("is-active");

        const overlay = document.createElement("div");
        overlay.className = "img-lightbox-overlay";

        const clone = document.createElement("img");
        clone.src = img.src;
        clone.alt = img.alt;
        overlay.appendChild(clone);

        const close = () => {
          overlay.style.animation = "overlayFadeIn 0.15s ease reverse forwards";
          setTimeout(() => overlay.remove(), 150);
          grid?.classList.remove("has-active");
          img.classList.remove("is-active");
        };

        overlay.addEventListener("click", close);
        document.addEventListener("keydown", e => {
          if (e.key === "Escape") close();
        }, { once: true });

        document.body.appendChild(overlay);
      });
    });
  }

  // Attach on load and whenever Reveal advances a slide or shows a fragment
  attachLightbox();
  if (window.Reveal) {
    Reveal.on("slidechanged", attachLightbox);
    Reveal.on("fragmentshown", attachLightbox);
  }
});
</script>
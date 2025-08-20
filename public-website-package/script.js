// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Email form handling
document.querySelector('.email-form').addEventListener('submit', function(e) {
    // Basic client-side validation
    const email = this.querySelector('input[type="email"]').value;
    if (!email || !email.includes('@')) {
        e.preventDefault();
        alert('Please enter a valid email address.');
        return;
    }
    
    // Form will submit to Formspree or similar service
    // Add any additional client-side validation here if needed
});

// Add loading state to email form
document.querySelector('.email-form button').addEventListener('click', function() {
    const button = this;
    const originalText = button.textContent;
    
    // Show loading state
    button.textContent = 'Subscribing...';
    button.disabled = true;
    
    // Reset after 3 seconds (adjust based on actual form handling)
    setTimeout(() => {
        button.textContent = originalText;
        button.disabled = false;
    }, 3000);
});

// Simple analytics tracking (replace with your preferred analytics)
function trackEvent(eventName, eventData = {}) {
    if (typeof gtag !== 'undefined') {
        gtag('event', eventName, eventData);
    }
    // Or use other analytics services
}

// Track important interactions
document.addEventListener('DOMContentLoaded', function() {
    // Track page load
    trackEvent('page_view', { page_title: document.title });
    
    // Track button clicks
    document.querySelectorAll('.cta-button').forEach(button => {
        button.addEventListener('click', function() {
            trackEvent('cta_click', { 
                button_text: this.textContent,
                button_location: this.getAttribute('href') 
            });
        });
    });
    
    // Track email signup
    document.querySelector('.email-form').addEventListener('submit', function() {
        trackEvent('email_signup', { form_location: 'newsletter' });
    });
    
    // Track section visibility (simple scroll tracking)
    const sections = document.querySelectorAll('section[id]');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                trackEvent('section_view', { section: entry.target.id });
            }
        });
    }, { threshold: 0.5 });
    
    sections.forEach(section => observer.observe(section));
});

// Mobile menu toggle (if you want to add a hamburger menu later)
function toggleMobileMenu() {
    const navLinks = document.querySelector('.nav-links');
    navLinks.classList.toggle('active');
}

// Add scroll effect to header
window.addEventListener('scroll', function() {
    const header = document.querySelector('header');
    if (window.scrollY > 100) {
        header.style.background = 'rgba(44, 85, 48, 0.95)';
    } else {
        header.style.background = 'linear-gradient(135deg, #2c5530 0%, #4a7c3a 100%)';
    }
});

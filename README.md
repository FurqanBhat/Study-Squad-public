<div class="image-grid">
    <img src="home.png" alt="Image Description" width="200" />
    <img src="bookmarks.png" alt="Image Description" width="200" />
    <img src="bookSession.png" alt="Image Description" width="200" />
    <img src="profile.png" alt="Image Description" width="200" />
    <img src="settings.png" alt="Image Description" width="200" />
    <!-- Add more images as needed -->
</div>
.image-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    align-items: flex-start;
}
.image-grid img {
    width: 100%;
    height: auto;
    vertical-align: top;
}


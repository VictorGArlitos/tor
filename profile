<?php
include("connection.php"); // Establish database connection

// Query to fetch all art records (ordered by most recent)
$artQuery = "SELECT art_id, art_name, art_des, 	image_path, date_posted FROM art ORDER BY date_posted DESC";
$artResult = $con->query($artQuery);

if (!$artResult) {
    die("Query Failed: " . $con->error);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Profile - Art Gallery</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: #211E1E;
      color: white;
      padding-top: 70px; /* For fixed navbar spacing */
    }
    .navbar {
      background: rgba(0, 0, 0, 0.8);
    }
    .profile-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .profile-header img {
      width: 100px;
      height: 100px;
      margin-bottom: 10px;
    }
    .art-piece {
      background: rgba(255, 255, 255, 0.1);
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 15px;
    }
    .art-piece img {
      width: 100%;
      border-radius: 5px;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">TintaPh</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"><a class="nav-link" href="event.php">Event</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Commotion</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Job</a></li>
        </ul>
      </div>
      <a href="profile.php">
        <img src="pr.png" alt="Profile" class="rounded-circle" width="40" height="40">
      </a>
    </div>
  </nav>

  <!-- Profile Header -->
  <div class="container">
    <div class="profile-header">
      <img src="pr.png" alt="Profile Image" class="rounded-circle" />
      <h2>Your Username</h2>
    </div>

    <!-- Art Gallery Section -->
    <div class="art-gallery">
      <h3>Your Art Gallery</h3>
      <div class="row">
        <?php while ($art = $artResult->fetch_assoc()) : ?>
          <div class="col-md-4">
            <div class="art-piece">
              <?php if (!empty($art['image_path'])): ?>
                <img src="<?= htmlspecialchars($art['image_path']) ?>" alt="<?= htmlspecialchars($art['art_name']) ?>">
              <?php endif; ?>
              <?php if (!empty($art['title'])): ?>
                <h5><?= htmlspecialchars($art['art_name']) ?></h5>
              <?php endif; ?>
              <p><?= htmlspecialchars($art['	art_des']) ?></p>
              <small><?= htmlspecialchars($art['date_posted']) ?></small>
            </div>
          </div>
        <?php endwhile; ?>
      </div>
    </div>
  </div>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

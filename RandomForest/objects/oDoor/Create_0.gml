self.is_opened = false
self.goto_next_level = false

self.scale = 0
self.scale_open_speed = 0.05
self.scale_speed = 0.005

self.scale_min = 0.3
self.scale_max = 0.4

self.x_factor = self.image_xscale
self.y_factor = self.image_yscale

// bloom
var bloom = instance_create_layer(self.x, self.y, "Bloom", oPortalBloom)
bloom.following = self
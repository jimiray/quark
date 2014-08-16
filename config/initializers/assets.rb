Rails.application.config.assets.precompile += %w( theme.js pages.js)
Rails.application.config.assets.precompile += ["codemirror*", "codemirror/**/*"]
Rails.application.config.assets.precompile += %w( animo.min.js )
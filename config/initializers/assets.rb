Rails.application.config.assets.precompile += ["admin/theme.js", "admin/pages.js"]
Rails.application.config.assets.precompile += ["codemirror*", "codemirror/**/*"]
Rails.application.config.assets.precompile += %w( animo.min.js )
Rails.application.config.assets.precompile += ["admin.css", "theme.css"]
Rails.application.config.assets.precompile += ["admin.js"]
Rails.application.config.assets.precompile += %w( pages.js )

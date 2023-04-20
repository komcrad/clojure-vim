{:user {:plugins [[lein-cloverage "1.1.2"]
                  [lein-cljfmt "0.6.7"]
                  [cider/cider-nrepl "0.25.4"]]
        :dependencies [[org.exupero/clipboard "0.1.0"]
                       [komcrad/repl-reload "0.1.3-SNAPSHOT"]
                       [nrepl "0.8.3"]
                       [pjstadig/humane-test-output "0.11.0"]
                       [cljfmt "0.6.7"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :repl-options {:init (do (require 'clojure.tools.namespace.repl 'repl-reload.core)
                                 (clojure.tools.namespace.repl/refresh)
                                 (repl-reload.core/reload)
                                 (repl-reload.core/auto-reload "shared" "cljc")
                                 (use 'clojure.repl))
                       :nrepl-middleware
                       [komcrad-utils.nrepl-middleware/wrap-clipboard]}}}

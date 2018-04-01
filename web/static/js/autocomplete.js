import Vue from 'vue'

import Autocomplete from 'v-autocomplete'

import App from './components/app.vue'

Vue.use(Autocomplete)

document.onreadystatechange = function () {
    if (document.readyState == "complete") {
        new Vue({
            // provide: apolloProvider.provide(),
            render: createEle => createEle(App)
        }).$mount('#app')
    }
}

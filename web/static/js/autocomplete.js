import Vue from 'vue'

import Autocomplete from 'v-autocomplete'

import App from './components/app.vue'

import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'


const httpLink = new HttpLink({
    // You should use an absolute URL here
    uri: 'http://localhost:4000/graphql-api',
})

// Create the apollo client
const apolloClient = new ApolloClient({
    link: httpLink,
    cache: new InMemoryCache(),
    connectToDevTools: true,
})

// Install the vue plugin
Vue.use(Autocomplete)
Vue.use(VueApollo)

document.onreadystatechange = function () {
    if (document.readyState == "complete") {
        new Vue({
            provide: apolloProvider.provide(),
            render: createEle => createEle(App)
        }).$mount('#app')
    }
}

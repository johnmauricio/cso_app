<template>
    <v-app>
        <v-navigation-drawer app></v-navigation-drawer>
        <v-app-bar
            app
            color="primary"
            dark
            >
            <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
            <v-toolbar-title>Application</v-toolbar-title>
        </v-app-bar>
        <v-content>
            <v-container fluid>
                <router-link tag="li" to="/">Home</router-link>
                <router-link tag="li" to="/about">About</router-link>
                <router-view></router-view>
            </v-container>
        </v-content>
        <v-footer app></v-footer>
    </v-app>
</template>

<script>
export default {
name: "App.vue"
}
</script>

<style scoped>

</style>

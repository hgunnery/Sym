# README

Thanks for having a look at the Sym app!

Over the last few months I have heard content creators start complaining about popular membership platforms and so decided that I would work on one that creators had complete control over. From within this app content creators can set cupporter levels and recieve subscription payments while providing supporters with various rewards. The title is as it sounds, the symbiotic relationship between content creator and supporter.

This is currently in a pre-alpha state and is not ready quite yet to be used in a production environment but feel free to watch for future updates. As it is not yet ready for a production environment there are no production deployment protoclols.

If you would like to have a play around with the app in its current state feel free to clone the repo. The app is set up to use mysql, have a look at the database example.

You will also need to set up your own stripe (and in the future paypal) keys. This needs to be done by running:

EDITOR=YOUR_FAVE_EDITOR_HERE rails credentials:edit --environment development

You will also need to setup the test environment the same way if you would like to run the test suite.

All tests on master and dev pass, run the tests via rake cucumber to run all of the features.

Beyond that, yes the banner and avatar images are my cat and my dog, but don't worry, you can replace them!

Attributions:

Social media icons: Dave Gandy / OFL (http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web)

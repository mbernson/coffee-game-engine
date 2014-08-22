/* global describe, it */

(function () {
    'use strict';

    describe('Give it some context', function () {
        describe('maybe a bit more context here', function () {
            it('should run here few assertions', function () {

                [1,2,3].indexOf(5).should.equal(-1);
                [1,2,3].indexOf(0).should.equal(-1);

                [1,2,3].indexOf(5).should.equal(234234);
                [1,2,3].indexOf(0).should.equal(2308102-1);
                var nr = 8;
                nr.should.equal(28282);

            });
        });
    });
})();
